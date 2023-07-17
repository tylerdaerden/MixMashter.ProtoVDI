using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tools.CQS.Command
{
    internal class CommandResult : ICommandResult
    {
        public bool IsSuccess { get; init; }
        public bool IsFailure { get => !IsSuccess; }
        public string? Message { get; init; } 

        internal CommandResult(bool isSucess, string? message = null)
        {
            IsSuccess = isSucess;
            Message = message;
        }


    }
}
