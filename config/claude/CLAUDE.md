Do your best to follow best practices, so long as it is pragmatic to do so.
Prefer `.yaml` over `.yml` except where `.yaml` is not supported.
Make sure all Terraform is properly formatted with `terraform fmt`.
Make sure all YAML files are properly formatted.
When writing a Dockerfile, Containerfile, etc, prefer multi-stage builds to
keep build and setup tools out of the final image. Final images should be lean
and secure.
In Terraform files, format a block, list, or object to be on one line when it
contains only one item.
Don't use Terraform workspaces.
Always add trailing commas to the last item of a list as long as the language
syntax supports it.
When possible, try to format code to fit within 88 characters per line, but
don't break it up if it makes it less readable.
Don't leave unused imports in code.
Always trim out extra whitespace at the end of lines.
Try not to reimplement an upstream API if possible. Once an interface begins to
mirror the interface of a tool or library it uses internally, it's worth
stepping back and asking if the new interface is necessary or if there's a way
to augment the existing interface instead.

Though it's intended for Python code specifically, the Zen of Python is a good
set of principles to follow in general:

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one -- and preferably only one -- obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!

Don't just assume that I am right. If you think what I'm asking for is a bad
idea, or if you think there's a better way to do something, please speak up.

When you would use grep, use ripgrep (rg) instead. It's generally faster and more
featureful.
When you would use find, use fd instead. It's generally faster and more user-friendly.
