#!/usr/bin/env python3

import sys
import subprocess

def main():
    yaml = sys.stdin.read().strip()
    yamls = yaml.split('\n---')
    for s in yamls:
        if len(s)>0:
            p = subprocess.Popen(['/usr/local/bin/kubeseal', '--format', 'yaml']+sys.argv[1:],
                                 stdin=subprocess.PIPE, stdout=subprocess.PIPE)
            (out, err) = p.communicate(s.encode('utf-8'))
            if err:
                sys.stderr.write(err.decode('utf-8'))
            if out:
                sys.stdout.write(out.decode('utf-8'))
            sys.stdout.write('---\n')

if __name__ == "__main__":
   sys.exit(main())
