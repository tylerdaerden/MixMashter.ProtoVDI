namespace Tools.CQS.Command
{
    public interface ICommandResult
    {
        static ICommandResult Success()
        {
            return new CommandResult(true);
        }


    }
}