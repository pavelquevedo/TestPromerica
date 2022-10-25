using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace Pregunta4
{
    public class Conexion
    {
        private readonly string connectionString = ConfigurationManager.AppSettings["ConnectionString"].ToString();

        /// <summary>
        /// Método que retorna un dataset con todos los registros de la tabla MENSAJE si el parámetro "returnDataSet" es verdadero.
        /// Si el parámetro "returnDataSet" es falso, retornará la cantidad de registros consultados.
        /// </summary>
        public dynamic ConsultaMensajes(bool returnDataSet)
        {
            SqlDataAdapter adapter;
            DataSet result = new DataSet();
            int rows = 0;

            string queryString =
                "SELECT COD_MENSAJE, PROYECTO, PRODUCTO FROM MENSAJE";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                SqlDataReader reader = null;

                try
                {
                    connection.Open();
                    adapter = new SqlDataAdapter(queryString, connection);

                    if (returnDataSet)
                    {
                        adapter.Fill(result);
                    }
                    else
                    {
                        reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                                rows++;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }

            //Si se desea el dataset, lo retorna, de lo contrario retornará el número de filas.
            if (returnDataSet)
            {
                return result;
            }
            else
            {
                return rows;
            }
        }

        /// <summary>
        /// Método que inserta un nuevo mensaje, y retorna un entero con la cantidad de registros que fueron afectados.
        /// </summary>
        public int InsertarMensaje()
        {
            int affectedRecords = 0;
            string queryString =
                "INSERT INTO MENSAJE(COD_MENSAJE,COD_FORMATO,PROYECTO,PRODUCTO) VALUES (1,1,'PREMIA','PREMIA CLASICA')";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);

                try
                {
                    connection.Open();
                    affectedRecords = command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }

            return affectedRecords;
        }
    }
}
