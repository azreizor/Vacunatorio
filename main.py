# Alumno: Hector Mellado Garrido 
# Proyecto Vacunatorio 



import pymysql
from time import localtime
from flask import Flask, render_template, request, redirect, url_for
from datetime import date, datetime, time, timedelta

db = pymysql.connect("localhost","root","","vacunatorio")



app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")



#---------------------------------------------------------------------------
#VACUNAAAAAAAAAAAAASSSS
@app.route("/consultar_vacunas/<string:rut>")
def consultar_vacunas(rut):
    cursor = db.cursor()
    cursor.execute("SELECT * FROM vacunas AS v, pacientes AS p, paciente_vacuna AS pv WHERE v.id_vacuna = pv.id_vacuna AND p.rut_paciente = pv.rut_paciente AND pv.rut_paciente = %s", rut)
    pvacunas = cursor.fetchall()
    cursor.close()
    return render_template("paciente_vacunas.html", pvacunas = pvacunas)


#---------------------------------------------------------------------------

@app.route("/campaña")
def campaña():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM vacunas AS v, pacientes AS p, paciente_vacuna AS pv WHERE v.id_vacuna = pv.id_vacuna AND p.rut_paciente = pv.rut_paciente")
    camp = cursor.fetchall()
    cursor.close()
    return render_template("camp.html", camp = camp)


#---------------------------------------------------------------------------

@app.route("/vacunar/<string:rut>")
def vacunar(rut):

    cursor = db.cursor()
    cursor.execute("SELECT * FROM pacientes where rut_paciente = %s", rut )
    paciente = cursor.fetchall()
    cursor.execute("SELECT * FROM vacunas")
    vacunas = cursor.fetchall()
    cursor.close()
    return render_template("vacunar.html", paciente = paciente, vacunas=vacunas)

@app.route("/vacunar_bdd", methods = ["POST"])
def vacunar_bdd():
    if request.method == "POST":
        rut_paciente = request.form["rut_paciente"]
        vacuna = request.form["vacuna"]
        fecha = date(*localtime()[:3])
        cursor = db.cursor()
        cursor.execute("INSERT INTO paciente_vacuna (rut_paciente, id_vacuna, fecha_vacunacion) VALUES (%s,%s,%s)", 
        (rut_paciente, vacuna, fecha))
        db.commit()
        cursor.close()
        return redirect(url_for('campaña'))
#---------------------------------------------------------------------------

@app.route("/listar_vacunas")
def listar_vacunas():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM vacunas")
    vacunas = cursor.fetchall()
    cursor.close()
    return render_template("vacunas.html", vacunas = vacunas)

#---------------------------------------------------------------------------

@app.route("/formulario_vacuna")
def formulario_vacuna():
    return render_template("formulario_vacuna.html")

#---------------------------------------------------------------------------

@app.route("/agregar_vacuna", methods = ["POST"])
def agregar_vacuna():
    if request.method == "POST":
        enfermedad = request.form["nombre_enfermedad"]
        cursor = db.cursor()
        fecha = date(*localtime()[:3])
        cursor.execute("INSERT INTO vacunas (nombre_enfermedad, fecha_registro) VALUES (%s,%s)", 
        (enfermedad, fecha))
        db.commit()
        cursor.close()
        return redirect(url_for('listar_vacunas'))

#---------------------------------------------------------------------------

@app.route("/vacunados/<string:id>")
def vacunados(id):

    cursor = db.cursor()
    cursor.execute("SELECT * FROM vacunas AS v, pacientes AS p, paciente_vacuna AS pv WHERE v.id_vacuna = pv.id_vacuna AND pv.rut_paciente = p.rut_paciente AND v.id_vacuna = %s", id)
    vacunados = cursor.fetchall()   
    cursor.close()  
    return render_template("vacuna_pacientes.html", vacunados = vacunados)

#---------------------------------------------------------------------------
#PACIENTEEEEEESSSS
@app.route("/listar_pacientes")
def listar_pacientes():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM pacientes")
    pacientes = cursor.fetchall()
    cursor.close()
    return render_template("pacientes.html", pacientes = pacientes)

#---------------------------------------------------------------------------

@app.route("/formulario_paciente")
def formulario_paciente():
    return render_template("formulario_paciente.html")

#---------------------------------------------------------------------------

@app.route("/agregar_paciente", methods = ["POST"])
def agregar_paciente():
    if request.method == "POST":
        rut_paciente = request.form["rut_paciente"]
        nombre_paciente = request.form["nombre_paciente"]
        telefono = request.form["telefono"]
        fecha_nacimiento = request.form["fecha_nacimiento"]
        cursor = db.cursor()
        cursor.execute("INSERT INTO pacientes (rut_paciente, nombre_paciente, telefono, fecha_nacimiento) VALUES (%s,%s,%s,%s)", 
        (rut_paciente, nombre_paciente, telefono, fecha_nacimiento))
        db.commit()
        cursor.close()
        return redirect(url_for('listar_pacientes'))

#---------------------------------------------------------------------------




if __name__ == "__main__":
    app.run(debug=True)