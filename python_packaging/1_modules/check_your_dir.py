import mod
import mod.package as package
import mod.package.subpackage as subpackage

print("> dir()")
print(dir())
print("> dir(mod)")
print(dir(mod))
print("> dir(package)")
print(dir(package))
print("> dir(subpackage)")
print(dir(subpackage))
print("> dir(subpackage.util)")
print(dir(subpackage.util))
