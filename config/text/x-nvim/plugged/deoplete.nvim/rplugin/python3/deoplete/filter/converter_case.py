# ============================================================================
# FILE: converter_case.py
# AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
# License: MIT license
# ============================================================================

from deoplete.base.filter import Base
from deoplete.util import Nvim, UserContext, Candidates


class Filter(Base):
    def __init__(self, vim: Nvim) -> None:
        super().__init__(vim)

        self.name = 'converter_case'
        self.description = 'case converter'

    def filter(self, context: UserContext) -> Candidates:
        complete_str = context['complete_str']
        complete_lower = complete_str.lower()
        complete_len = len(complete_str)
        debug(self.vim, context['candidates'])
        for candidate in [
                x for x in context['candidates']
                if x['word'].lower().startswith(complete_lower)]:
            candidate['word'] = complete_str + candidate[
                'word'][complete_len:]
        return context['candidates']  # type: ignore
