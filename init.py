#!/usr/bin/env python 

import uuid

def main():
    guid = str(uuid.uuid4())

    for i in ['tiapp.xml', 'manifest']:
        f = open(i, 'r+')
        tmp = f.read()
        if '__GUID__' in tmp:
            tmp = tmp.replace('__GUID__', guid)
            f.seek(0)
            f.write(tmp)
        f.close()

if __name__ == '__main__':
    main()
