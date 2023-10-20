import asyncio


async def produce(item: int, queue: asyncio.Queue) -> None:
    await asyncio.sleep(0.543)
    await queue.put(item)
    print(f"Producer added <{item}> to queue.")


async def consume(queue: asyncio.Queue):
    while True:
        await asyncio.sleep(1.23)
        item = await queue.get()
        print(f"Consumer got element <{item}>")
        queue.task_done()


async def job(num_messages: int):
    queue = asyncio.Queue()
    producer_tasks = [asyncio.create_task(produce(item, queue)) for item in range(num_messages)]
    consumer_tasks = [asyncio.create_task(consume(queue)) for _ in range(num_messages)]
    await asyncio.gather(*producer_tasks)
    await queue.join()  # Implicitly awaits consumers, too
    for c in consumer_tasks:
        c.cancel()


if __name__ == '__main__':
    asyncio.run(job(num_messages=3))
