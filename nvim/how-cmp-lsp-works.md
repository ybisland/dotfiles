Some plugins work together to complete the code. I'd like to explain how these 
plugins work together and how to set up these plugins.

## Snippet engine (Luasnip)
Luasnip is a snippet engine, which gives neovim the snippet feature. 
This snippet feature provided by Luasnip can do something like:

1. expand snippets. 

Snippets can be defined by users or provided by some snippets plugins which 
gives a bunch of snippets, such as `friendly-snippets`. In another word, 
uasnip is like a car engine, and the snippets plugins is fuel.

Now suppose you have a snippet `int main() { $1\n return 0; }`, and its trigger 
word is `main`. Then you can hit the character sequence, and call the 
Luasnip API `expand()` (usually mapped into `<Tab>`), snippet engine(Luasnip) 
will expand this snippet.

2. jump between nodes

Here is a snippet `aa $1 bb $2`. 
After expansion, cursor will be at `$1`. 
After jumping forward, cursor will be at `$2`.
After jumping backforward, cursor will be at `$1`.

3. parse different snippet syntax(formats)

There are some different snippet syntax(formats), such as sublime-snippet, 
vscode-snippet, textmate-snippet, etc. Luasnip define snippet in Lua, and it 
can parse vscode-like, snipmate-like and LSP-snippet into snippets in Lua.


## nvim-cmp

Though Luasnip can parsr many snippet formats, nvim-cmp only use Luasnip to 
parse and expand LSP-snippet.

Nvim-cmp takes snippets from many sources, and displays these snippets on  
completion menu. As we choose a completion item, nvim-cmp pass the item into 
Luasnip via the callback `nvim-cmp.setup.snippet.expand`, which virtually 
call the `luasnip.lsp_expand`.

Besides, snippets plugin(`friendly-snippets`) provides snippets to Luasnip.
Then Luasnip, as a source of nvim-cmp, provides snippets to nvim-cmp, so that
nvim-cmp can displays these snippets on completion menu. If we choose a snippet
comes from Luasnip, the snippet will be pass back to Luasnip to be expanded.



