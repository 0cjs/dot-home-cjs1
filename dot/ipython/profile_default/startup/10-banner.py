import sys, IPython
print('IPython {} Python {}'.format(
    IPython.__version__, sys.version[0:sys.version.find(' ')]))
