import asyncio


async def produce(name: str, item: int, queue: asyncio.Queue) -> None:
    await asyncio.sleep(0.543)
    await queue.put(item)
    print(f"Producer-{name} added <{item}> to queue.")


async def consume(name: str, queue: asyncio.Queue):
    while True:
        await asyncio.sleep(1.23)
        item = await queue.get()
        print(f"Consumer-{name} got element <{item}>")
        queue.task_done()


async def job(num_messages: int):
    queue = asyncio.Queue()
    producer_tasks = [asyncio.create_task(produce(name=str(item), item=item, queue=queue)) for item in range(num_messages)]
    consumer_tasks = [asyncio.create_task(consume(name=str(item), queue=queue)) for item in range(num_messages)]
    await asyncio.gather(*producer_tasks)
    await queue.join()  # Implicitly awaits consumers, too
    for c in consumer_tasks:
        c.cancel()


if __name__ == '__main__':
    asyncio.run(job(num_messages=3))
