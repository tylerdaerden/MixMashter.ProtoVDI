var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

ConfigureService(builder.Services);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();

 static void ConfigureService(IServiceCollection service)
{
    service.AddControllers();
    service.AddEndpointsApiExplorer();
    service.AddSwaggerGen();
}