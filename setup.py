from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

extensions = [
    Extension("rr_graph.graph2_cpy", ["rr_graph/graph2_cpy.pyx"],
        include_dirs=[".",
            "third_party/pycapnp/",
            "/usr/local/google/home/keithrothman/cat_x/vtr-verilog-to-routing/build/libs/libvtrcapnproto/gen/",
            ],
        )
]

setup(
    name='rr_graph',
    version='1.0',
    packages=['rr_graph',],
    ext_modules = cythonize(extensions),
    long_description=open('README.md').read()
)
