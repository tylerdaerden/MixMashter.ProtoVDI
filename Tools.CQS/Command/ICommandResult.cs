namespace Tools.CQS.Command
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
