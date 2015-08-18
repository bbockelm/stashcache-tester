
import os
from setuptools import setup, find_packages

# Utility function to read the README file.
# Used for the long_description.  It's nice, because now 1) we have a top level
# README file and 2) it's easier to type in the README file than to put a raw
# string in below ...
def read(fname):
    return open(os.path.join(os.path.dirname(__file__), fname)).read()

setup(
    name = "stashcache_tester",
    version = "0.0.1",
    author = "Derek Weitzel",
    author_email = "dweitzel@cse.unl.edu",
    description = ("A tester for the StashCache infrastructure"),
    license = "Apache 2.0",
    keywords = "StashCache testing",
    
    install_requires = ['jinja2', 'humanfriendly', 'matplotlib'],
    
    url = "https://github.com/djw8605/stashcache-tester",
    
    packages=find_packages('lib'),
    package_dir = {'':'lib'},
    package_data = {
        'stashcache_tester': ['templates/*']
    },
    
    long_description=read('README.rst'),
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Topic :: Utilities",
    ],
)
