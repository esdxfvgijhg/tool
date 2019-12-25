import subprocess

"""Sample filters for doing mildly useful things using FilterPipes."""

try:
    from FilterPipes import filterpipes  # ST3-style import
except ImportError:
    import filterpipes  # ST2-style import


class ReverseWordsCommand(filterpipes.FilterPipesCommandBase):
    """Reverse the order of selected words. Extremely simple example."""
    def filter(self, data):
        return " ".join(reversed(data.split(" ")))


class CamelCaseFilterCommand(filterpipes.FilterPipesCommandBase):
    """Converts words_with_underlines to CamelCase."""
    initial_caps = True

    def filter(self, data):
        next_upper = self.initial_caps
        out = []
        for c in data:
            if c == '_':
                next_upper = True
            elif c.islower():
                if next_upper:
                    out.append(c.upper())
                else:
                    out.append(c)
                next_upper = False
            else:
                next_upper = self.initial_caps and not c.isalnum()
                out.append(c)
        return ''.join(out)


class UnderscoreCaseFilterCommand(filterpipes.FilterPipesCommandBase):
    """Converts CamelCase to words_with_underlines."""

    def filter(self, data):
        prev_lower = False
        out = []
        for c in data:
            if c.isupper():
                if prev_lower:
                    out.append('_')
                out.append(c.lower())
                prev_lower = False
            elif c.islower():
                prev_lower = True
                out.append(c)
            else:
                prev_lower = False
                out.append(c)
        return ''.join(out)


class SurroundSelectionCommand(filterpipes.FilterPipesCommandBase):
    """Prepends and appends some string to the selected text."""
    def filter(self, data):
        p=subprocess.Popen("echo '%s' | sed -z -r '\n\
            s/\\n\\n+/</g\n\
            s/([^\\n]+)/\\1>/g\n\
            s/\\.[ \\t]*\\n/vgyhn/g\n\
            s/}[ \\t]*\\n/pvkglyhn/g\n\
            \n\
            s/\\n[\\t ]*/ /g\n\
            s/\\t+//g\n\
            \n\
            s/(\\.)[ \\t]+([^0-9])/\\1\\n\\2/g\n\
            s/([,:;])[ \\t]+([^0-9])/\\1\\n\\t\\2/g\n\
            \n\
            s/vgyhn/\\.\\n/g\n\
            s/pvkglyhn/\\}\\n/g\n\
            s/</\\n\\n/g\n\
            s/>[ \\t]*/\\n/g\n\
            \n\
            s/\\- //g'" % data, bufsize = -1,
            cwd = r'P:\4 electronics\soft\Sublime Text projects\STM32F1-test0-GPIO\source\user-code',
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            startupinfo=startupinfo,
            shell=True,
            creationflags=subprocess.SW_HIDE)

        output, stderr = p.communicate()
        if (stderr):
            print(stderr)
        return output




