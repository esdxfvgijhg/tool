import sublime
import sublime_plugin


class SurroundSelectionCommand(filterpipes.FilterPipesCommandBase):
	"""Prepends and appends some string to the selected text."""
	prepend = '{'
	append = '}'
	def filter(self, data):
		return self.prepend + data + self.append


