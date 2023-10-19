from abc import ABC, abstractmethod
from Customer import Customer
from Asset import Asset


class EnergyProvider(ABC):
    @abstractmethod
    def balance_the_grid(self, asset: Asset) -> None:
        pass

    @abstractmethod
    def provide_gas(self, customer: Customer) -> None:
        pass

    @abstractmethod
    def provide_electricity(self, customer: Customer) -> None:
        pass
