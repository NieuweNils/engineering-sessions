import asyncio
import time


async def hello():
    print("hello")
    await asyncio.sleep(3)
    print("world")


async def how_are_you():
    print("how")
    await asyncio.sleep(1)
    print("are")
    await asyncio.sleep(1)
    print("you")


async def doing():
    await asyncio.sleep(2.5)
    print("doing")


async def main():
    await asyncio.gather(hello(), doing(), how_are_you())


if __name__ == '__main__':
    s = time.perf_counter()
    asyncio.run(main())
    elapsed = time.perf_counter() - s
    print(f"intro.py executed in {elapsed:0.2f} seconds.")
