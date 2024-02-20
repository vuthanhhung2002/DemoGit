using Microsoft.EntityFrameworkCore;
using ThucTapChuyenMonLTW.Models;
using ThucTapChuyenMonLTW.Reponsitory;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
var connectionString = builder.Configuration.GetConnectionString("Qlbongda1065Context");
builder.Services.AddDbContext<Qlbongda1065Context>(x => x.UseSqlServer(connectionString));
builder.Services.AddSession();

builder.Services.AddScoped<ICauLacBoRepository,CauLacBoRepository>();
var app = builder.Build();
// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
	app.UseExceptionHandler("/Home/Error");
	// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
	app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();
app.UseSession();
app.UseAuthorization();

app.MapControllerRoute(
	name: "default",
	pattern: "{controller=Access}/{action=Login}/{id?}");

app.Run();
