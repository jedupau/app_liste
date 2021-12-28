import os


for fichier in os.listdir("/app_liste/frontend/assets/vendome"):
    if(fichier != "rename.py" and fichier!="0.jpg"):
        f = fichier
        f = "test" + f
        file_newname_newfile = os.path.join("/app_liste/frontend/assets/vendome", f)
        os.rename(fichier, file_newname_newfile)

for fichier in os.listdir("/app_liste/frontend/assets/vendome"):
    if(fichier != "rename.py" and fichier!="0.jpg"):
        f = fichier
        f = f.replace("test", "")
        f = f.replace(".jpg", "")
        i = int(f)
        f = str(i - 1)
        f += ".jpg"
        file_newname_newfile = os.path.join("/app_liste/frontend/assets/vendome", f)
        os.rename(fichier, file_newname_newfile)

    