using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tool.Cqs.Commands;

namespace Tools.CQS.Command
{
    public interface ICommandHandler<TCommand>
        where TCommand : class , ICommandDefinition
    {
        ICommandResult Execute(TCommand command);
    }
}
