using System.Data;
using System.Data.SqlClient;

namespace SuperMercado.DAL
{
    public class Acceso
    {
        SqlConnection _conexion;
        SqlTransaction? _transaction;

        //este ctor es para que no puedan crear instancias con new
        private Acceso()
        {
            //conexion juli
            _conexion = new SqlConnection("Data Source=.;Initial Catalog=SuperMercado;Integrated Security=True");


            //conexion fede
            //_conexion = new SqlConnection("");
        }
        private static Acceso? _instance = null;

        public static Acceso GetInstance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new Acceso();
                }

                return _instance;
            }
        }

        private void CerrarConexion()
        {
            try
            {
                _conexion.Close();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void AbrirConexion()
        {
            try
            {
                _conexion.Open();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public DataTable Leer(string st, SqlParameter[] parameters)
        {
            CerrarConexion();
            AbrirConexion();
            DataTable dataTable = new DataTable();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
            sqlDataAdapter.SelectCommand = new SqlCommand();
            sqlDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDataAdapter.SelectCommand.CommandText = st;
            if (parameters != null)
            {
                sqlDataAdapter.SelectCommand.Parameters.AddRange(parameters);
            }
            sqlDataAdapter.SelectCommand.Connection = _conexion;
            try
            {
                sqlDataAdapter.Fill(dataTable);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            CerrarConexion();
            return dataTable;
        }

        public int Escribir(string st, SqlParameter[] parameters)
        {
            CerrarConexion();
            _transaction = _conexion.BeginTransaction();
            SqlCommand sqlCommand = new SqlCommand()
            {
                CommandType = CommandType.StoredProcedure,
                CommandText = st,
                Connection = _conexion,
            };
            sqlCommand.Parameters.AddRange(parameters);
            try
            {
                sqlCommand.Transaction = _transaction;
                sqlCommand.ExecuteNonQuery();
                _transaction.Commit();
            }
            catch (Exception ex)
            {
                _transaction.Rollback();
                return 0;
            }
            CerrarConexion();
            return 1;
        }
    }
}