using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tool.Cqs.Commands
{
    public interface ICommandResult
    {
        static ICommandResult Failure(string message)
        {
            return new CommandResult(false, message);
        }
        static ICommandResult Success()
        {
            return new CommandResult(true);
        }

        bool IsSuccess { get; }
        bool IsFailure { get; }
        string? Message { get; }
    }
}
