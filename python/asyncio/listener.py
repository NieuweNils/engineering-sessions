import random
import asyncio


async def async_range(count):
    for i in range(count):
        yield i
        await asyncio.sleep(0.0)


async def consumer(name: str, queue: asyncio.Queue):
    while True:
        await asyncio.sleep(random.random())
        item = await queue.get()
        print(f"Consumer-{name} got element <{item}>")
        queue.task_done()


async def process_messages(num_consumers: int, num_messages: int) -> None:
    queue = asyncio.Queue()
    tasks = []
    # create consumers
    for i in range(num_consumers):
        tasks.append(asyncio.create_task(consumer(name=f"{i}", queue=queue)))
    # produce messages
    async for i in async_range(num_messages):
        await asyncio.sleep(random.random())
        await queue.put(i)
    # consume messages
    await queue.join()  # Implicitly awaits consumers, too
    # cleanup tasks
    for task in tasks:
        task.cancel()
    await asyncio.gather(*tasks, return_exceptions=True)


if __name__ == '__main__':
    asyncio.run(process_messages(num_consumers=3, num_messages=20))
