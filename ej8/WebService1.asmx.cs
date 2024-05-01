using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ej8
{
    /// <summary>
    /// Descripción breve de WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hola a todos";
        }

        [WebMethod]
        public int ModificarPersona(int id_persona,
                                    string nombre, 
                                    string apellido, 
                                    int edad, 
                                    string rol, 
                                    string direccion,
                                    string departamento,
                                    string contraseña)
        {
            try
            {
                MySqlConnection con = new MySqlConnection();
                string servidor = "localhost";
                string bd = "BDRafael";
                string usuario = "root";
                string password = "";
                string CadenaConexion = "server=" + servidor + ";" + "user=" + usuario + ";" + "password=" + password + ";" + "database=" + bd + ";";
                string query = "UPDATE persona SET nombre ='" + nombre + "', apellido='" + apellido + "', edad='" + edad + "', rol='" + rol + "', direccion='" + direccion + "', departamento='" + departamento + "', contraseña='" + contraseña + "' WHERE id_persona = " + id_persona;
                con.ConnectionString = CadenaConexion;
                con.Open();
                MySqlCommand comando = new MySqlCommand(query, con);
                comando.ExecuteNonQuery();
                con.Close();
                Console.WriteLine("Se ha modificado la persona con id: " + id_persona);
                return 2;



            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return 0;
            }
        }

        //agregar persona
        [WebMethod]
        public int AgregarPersona(string nombre, string apellido, int edad, string rol, string direccion, string departamento, string contraseña)
        {
            try
            {
                MySqlConnection con = new MySqlConnection();
                string servidor = "localhost";
                string bd = "BDRafael";
                string usuario = "root";
                string password = "";
                string CadenaConexion = "server=" + servidor + ";" + "user=" + usuario + ";" + "password=" + password + ";" + "database=" + bd + ";";
                con.ConnectionString = CadenaConexion;
                con.Open();
                string query = "INSERT INTO persona (nombre, apellido, edad, rol, direccion,departamento, contraseña) VALUES ('" + nombre + "', '" + apellido + "', '" + edad + "', '" + rol + "', '" + direccion + "', '"+departamento+ "', '" + contraseña + "')";
                MySqlCommand comando = new MySqlCommand(query, con);
                comando.ExecuteNonQuery();
                con.Close();
                Console.WriteLine("Se ha agregado una nueva persona.");
                return 1;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return 0;
            }
        }

        //eliminar persona
        [WebMethod]
        public int EliminarPersona(int id_persona)
        {
            try
            {
                MySqlConnection con = new MySqlConnection();
                string servidor = "localhost";
                string bd = "BDRafael";
                string usuario = "root";
                string password = "";
                string CadenaConexion = "server=" + servidor + ";" + "user=" + usuario + ";" + "password=" + password + ";" + "database=" + bd + ";";
                con.ConnectionString = CadenaConexion;
                con.Open();
                string query = "DELETE FROM persona WHERE id_persona = " + id_persona;
                MySqlCommand comando = new MySqlCommand(query, con);
                comando.ExecuteNonQuery();
                con.Close();
                Console.WriteLine("Se ha eliminado la persona con id: " + id_persona);
                return 1;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return 0;
            }
        }

    }
}
