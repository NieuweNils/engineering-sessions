import mod
import mod.submodule as submodule
import mod.submodule.subsubmodule as subsubmodule

print("> dir()")
print(dir())
print("> dir(mod)")
print(dir(mod))
print("> dir(submodule)")
print(dir(submodule))
print("> dir(subsubmodule)")
print(dir(subsubmodule))
