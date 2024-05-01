using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace ST10203070_PROG7311_POE
{
    public static class PasswordHashingUtility
    {
        // Method to create salt for password hashing
        public static string CreateSalt(int size)
        {
            var rng = new RNGCryptoServiceProvider();
            var buffer = new byte[size];
            rng.GetBytes(buffer);
            return Convert.ToBase64String(buffer);
        }

        // Method to generate password hash
        public static string GenerateSHA256Hash(string input, string salt)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(input + salt);
            using (SHA256Managed sha256hashstring = new SHA256Managed())
            {
                byte[] hash = sha256hashstring.ComputeHash(bytes);
                return ByteArrayToHexString(hash);
            }
        }

        // Method to convert byte array to hex string
        private static string ByteArrayToHexString(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length * 2);
            foreach (byte b in ba)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString();
        }
    }

}