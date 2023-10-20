## Dataclasses in Python

### setup:
`./install_pyenv.sh`\
`./create_pyenv_install_reqs.sh`

order of tutorials:
1. `intro.py`
2. `queue.py`
3. `listener.py`

now try:
- adding a *non-blocking* function call in the consumer task in `listener.py` to at random change the prompt to one of:
  - `Consumer-{name} happily processed element <{item}>`
  - `Consumer-{name} begrudgingly processed element <{item}>`
  - `Consumer-{name} processed element <{item}> to put food on the table for its children`

See https://realpython.com/async-io-python/ for a LOT more on asyncio.\
Python docs: https://docs.python.org/3/library/asyncio.html