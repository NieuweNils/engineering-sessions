from abc import ABC, abstractmethod
from python.oop.dataclass.WindTurbine import WindTurbine
from Asset import Asset


class WindFarmOwner(ABC):
    @abstractmethod
    def service(self, wind_mill: WindTurbine) -> None:
        pass

    @abstractmethod
    def balance_the_grid(self, asset: Asset) -> None:
        pass
