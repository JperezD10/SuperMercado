using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BLL
{
    public class Encriptacion
    {
        public static string EncriptadoPermanente(string contraseña)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(contraseña);
            SHA256Managed sha256 = new SHA256Managed();
            byte[] hash = sha256.ComputeHash(bytes);
            return transformarByte(hash);
        }

        private static byte[] FromHex(string hex)
        {
            hex = hex.Replace("-", "");
            byte[] raw = new byte[hex.Length / 2];
            for (int i = 0; i < raw.Length; i++)
            {
                raw[i] = Convert.ToByte(hex.Substring(i * 2, 2), 16);
            }
            return raw;
        }

        private static string transformarByte(byte[] hash)
        {
            StringBuilder hex = new StringBuilder(hash.Length * 2);
            foreach (byte b in hash) hex.AppendFormat("{0:x2}", b);
            return hex.ToString();
        }

        static DESCryptoServiceProvider des = new DESCryptoServiceProvider();
        static byte[] llave = Encoding.UTF8.GetBytes("1DC9DC24"); //Pones la llave que vos quieras aca pero que sean 8 caraceteres.

        //Nota a tener en cuenta. El algoritmo DES (Data Encryption Standard) utiliza/espera una llave de 56 bits (64 en total pero 8 son usados para igualar y complementar).
        //Por ende, 64 bits de llave ---> 8 bytes ---> 8 caracteres.

        public static string EncriptadoReversible(string mensajePlano)
        {
            byte[] bytesEncriptados = Encoding.UTF8.GetBytes(mensajePlano); //Se pasa el texto sin encriptar a byte[].
            byte[]? mensajeEncriptado = null;
            using (var MemoryStream = new MemoryStream())
            {
                ICryptoTransform transformador = des.CreateEncryptor(llave, llave); //Se crea un encriptador.
                CryptoStream stream = new CryptoStream(MemoryStream, transformador, CryptoStreamMode.Write); //Se crea un steam de criptografia para poder trabajar bien los bytes.
                stream.Write(bytesEncriptados, 0, bytesEncriptados.Length);
                stream.FlushFinalBlock();
                stream.Close();
                mensajeEncriptado = MemoryStream.ToArray(); //Se llenan los bytes con el array de la memoria del stream.
            }
            var hexString = BitConverter.ToString(mensajeEncriptado);
            return hexString.Replace("-", ""); //Retornas los bytes pasados a String.
        }

        public static string Desencriptar(string mensajeEncriptado) //Lo mismo pero para desencriptar
        {
            byte[] bytesEncriptados = FromHex(mensajeEncriptado);
            byte[]? mensajeDesencriptado = null;
            using (var MemoryStream = new MemoryStream())
            {
                ICryptoTransform transformador = des.CreateDecryptor(llave, llave);
                CryptoStream stream = new CryptoStream(MemoryStream, transformador, CryptoStreamMode.Write);
                stream.Write(bytesEncriptados, 0, bytesEncriptados.Length);
                stream.FlushFinalBlock();
                stream.Close();
                mensajeDesencriptado = MemoryStream.ToArray();
            }
            return Encoding.UTF8.GetString(mensajeDesencriptado);
        }
    }
}
