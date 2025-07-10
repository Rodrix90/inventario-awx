import pandas as pd
import yaml
import shutil

df = pd.read_excel("inventario_pe.xlsx")

estructura = {"all": {"children": {}}}

for _, row in df.iterrows():
    grupo = row["grupo"]
    if grupo not in estructura["all"]["children"]:
        estructura["all"]["children"][grupo] = {"hosts": {}}
    estructura["all"]["children"][grupo]["hosts"][row["hostname"]] = {
        "ansible_host": row["ip"]
    }

with open("hosts.yml", "w") as f:
    yaml.dump(estructura, f, sort_keys=False)

# Copiar hosts.yml al repositorio Git local
shutil.copy("hosts.yml", r"C:/Users/ragonzalez/Documents/inventario-awx/awx_generador_ruta_personalizada/hosts.yml")
