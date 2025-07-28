from random import SystemRandom
import string
import uuid
import time
import datetime


def main():
    while 1:
        timestamp = datetime.datetime.now()
        rand_str = uuid.uuid4()
        print(f"{timestamp}: {rand_str}")
        time.sleep(5)


if __name__ == '__main__':
    main()
