using System.Data.Common;
using MixMashter.Api.Models.Entities;
using MixMashter.Api.Models.Services;
using MixMashter.Api.Models.Command;
using MixMashter.Api.Models.Repositories;
using System.Data.SqlClient;
using Tools.CQS.Command;
using System.Globalization;

internal class Program
{
    private static void Main(string[] args)
    {
        const string ConnectionString = "Data Source=FORMA-VDI303\\TFTIC;Initial Catalog=MixMashter.Database;Integrated Security=True";
        using (DbConnection dbconnectiontest = new SqlConnection(ConnectionString))
        {
            IAuthRepository authRepository = new AuthService(dbconnectiontest);

            string BirthDateString = "15-11-1986";
            DateTime BirthDate = DateTime.ParseExact(BirthDateString, "dd-MM-yyyy", CultureInfo.InvariantCulture);

            ICommandResult result = authRepository.Execute(new RegisterCommand("Karim", "Debbache", "KaremDebiche", "Karim@jdg.fr", BirthDate , "Test1234="));
            Console.WriteLine(result.IsSuccess);


        }
    }
}