import zlib
import base64
import codecs

STRING = b"eJxjYBj6gBeIeZAwH5H6OIFYBQvmooEbBwoAAO2gAQc="
STRING = base64.b64decode(STRING)
STRING = zlib.decompress(STRING)
STRING = codecs.encode(STRING, "hex_codec")
STRING = str(STRING, "ascii")
count = 0
count2 = 0
line = ""
newchar = 0
print(codecs.encode(b"f", "hex_codec"))
for char in STRING:
    newchar = newchar + int(char)
    count = count + 1
    if count == 8:
        count2 = count2 + 1
        line = line + str(newchar)
        line = ""
        count = 0
    if count2 == 15:
        print(line)
print(count2/(15*8))