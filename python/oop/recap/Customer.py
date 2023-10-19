class Customer:
    positive_about_eneco = None

    def __init__(self, annual_gas_usage=1000, annual_electricity_usage=3000):
        self.annual_gas_usage = annual_gas_usage
        self.annual_electricity_usage = annual_electricity_usage
