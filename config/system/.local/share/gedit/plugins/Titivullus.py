from gi.repository import GObject, Gtk, Gedit
import subprocess
import xml.dom.minidom
from io import StringIO

UI_XML = """<ui>
<menubar name="MenuBar">
    <menu name="ToolsMenu" action="Tools">
      <placeholder name="ToolsOps_1">
        <menuitem name="TltCheck" action="TltCheck"/>
      </placeholder>
    </menu>
</menubar>
</ui>"""


class Titivullus(GObject.Object, Gedit.WindowActivatable):
    __gtype_name__ = "Titivullus"
    window = GObject.property(type=Gedit.Window)

    def __init__(self):
        GObject.Object.__init__(self)

    def _add_ui(self):
        manager = self.window.get_ui_manager()
        self._actions = Gtk.ActionGroup("TitivullusActions")
        self._actions.add_actions([
            ('TltCheck', Gtk.STOCK_INFO, "Proofread",
                None, "Proofread the current document",
                self.on_TltCheck_activate),
        ])
        manager.insert_action_group(self._actions)
        self._ui_merge_id = manager.add_ui_from_string(UI_XML)
        manager.ensure_update()

    def do_activate(self):
        self._add_ui()
        #panel = self.window.get_side_panel()
        panel = self.window.get_bottom_panel()
        icon = Gtk.Image.new_from_stock(Gtk.STOCK_YES, Gtk.IconSize.MENU)
        model = Gtk.ListStore(int, str, int, int)
        table = Gtk.TreeView(model)
        renderer = Gtk.CellRendererText()
        lineColumn = Gtk.TreeViewColumn("#", renderer, text=0)
        errorColumn = Gtk.TreeViewColumn("Error", renderer, text=1)
        lineColumn.set_sort_column_id(0)
        table.append_column(lineColumn)
        table.append_column(errorColumn)
        self._bottom_widget = table
        #self._side_widget = table
        #panel.add_item(self._side_widget, "ErrorList", "Error List", icon)
        panel.add_item(self._bottom_widget, "ErrorList", "Error List", icon)
        #panel.activate_item(self._side_widget)
        panel.activate_item(self._bottom_widget)
        select = table.get_selection()
        select.connect("changed", self.on_Row_activate)

    def do_deactivate(self):
        self._remove_ui()
        self._action_group = None

    def do_update_state(self):
        pass

    def on_Row_activate(self, selection):
        doc = self.window.get_active_document()
        model, treeiter = selection.get_selected()
        if not treeiter is None:
            index = model[treeiter][0] - 1
            s_off = model[treeiter][2]
            e_off = model[treeiter][3]
            doc.goto_line(index)
            start_iter = doc.get_iter_at_line_offset(index, s_off)
            end_iter = doc.get_iter_at_line_offset(index, e_off)
            doc.select_range(start_iter, end_iter)
            self.window.get_active_view().scroll_to_cursor()

    def on_TltCheck_activate(self, action, data=None):
        #model = self._side_widget.get_model()
        model = self._bottom_widget.get_model()
        model.clear()
        doc = self.window.get_active_document()
        if not doc:
            return
        conStr = "http://localhost:8081"
        for line in self.parseDoc():
            curlArg = "autodetect=1&text=" + line[1]
            result = subprocess.check_output(["curl", "--data", curlArg, conStr])
            errorMuch = self.parseXML(result)
            if errorMuch != []:
                for el in errorMuch:
                    stringa = el[0] + ": " + el[1]
                    model.append([line[0], stringa, el[2], el[3]])

    def get_text(self):
        start, end = self.window.get_active_document().get_bounds()
        return start.get_slice(end)

    def parseXML(self, xmlText):
        lineErr = []
        msg = ''
        context = ''
        start_off = 0
        end_off = 0
        doc = xml.dom.minidom.parseString(xmlText)
        nodes = doc.getElementsByTagName('error')
        for node in nodes:
            if node.nodeType == xml.dom.Node.ELEMENT_NODE:
                for (name, value) in node.attributes.items():
                    if name == 'msg':
                        msg = value
                    if name == 'context':
                        context = value
                    if name == 'offset':
                        start_off = value
                    if name == 'errorlength':
                        end_off = value
            if msg != '' and context != '':
                lineErr.append([msg, context, int(start_off), int(end_off)])
        return lineErr

    def parseDoc(self):
        doc = self.get_text()
        lines = []
        reader = StringIO.StringIO(doc)
        index = 1
        line = "buf"
        while(line != ''):
            line = reader.readline()
            lines.append([index, line])
            index += 1
        reader.close()
        return lines

    def _remove_ui(self):
        panel = self.window.get_bottom_panel()
        panel.remove_item(self._bottom_widget)
        manager = self.window.get_ui_manager()
        manager.remove_ui(self._ui_merge_id)
        manager.remove_action_group(self._actions)
        manager.ensure_update()
