from Customer import Customer
from Employee import Employee
from WindTurbine import WindTurbine


class Eneco:
    def __init__(self):
        self.employees = [Employee(salary=1) for _ in range(10)]
        self.wind_turbines = [WindTurbine() for _ in range(10)]
        self.customers = [Customer() for _ in range(10)]
