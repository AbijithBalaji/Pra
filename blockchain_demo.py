# blockchain_demo.py

import hashlib, json
from time import time

class Blockchain:
    def __init__(self):
        self.chain = []
        self.current_tx = []
        # create the genesis block
        self.new_block(proof=100, previous_hash='1')

    def new_block(self, proof, previous_hash):
        block = {
            'index':       len(self.chain) + 1,
            'timestamp':   time(),
            'transactions': self.current_tx,
            'proof':       proof,
            'previous_hash': previous_hash
        }
        # reset the transaction list
        self.current_tx = []
        self.chain.append(block)
        return block

    def new_tx(self, sender, recipient, amount):
        self.current_tx.append({
            'sender':    sender,
            'recipient': recipient,
            'amount':    amount
        })
        # this tx will go into the next mined block
        return self.last_block['index'] + 1

    @property
    def last_block(self):
        return self.chain[-1]

if __name__ == '__main__':
    bc = Blockchain()

    # Add a sample transaction
    bc.new_tx('Alice', 'Bob', 50)

    # “Mine” a new block with a dummy proof and print out the result
    prev_hash = hashlib.sha256(
        json.dumps(bc.last_block, sort_keys=True).encode()
    ).hexdigest()
    new_block = bc.new_block(proof=12345, previous_hash=prev_hash)

    # Print entire chain as JSON
    print(json.dumps(bc.chain, indent=2))
