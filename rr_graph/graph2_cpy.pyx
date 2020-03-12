# distutils: libraries = capnpc capnp-rpc capnp kj-async kj
# cython: language_level=3
# cython: language=c++
# cython: c_string_type = str
# cython: c_string_encoding = default
# cython: embedsignature = True
from capnp.includes.schema_cpp cimport MessageBuilder
from capnp.lib.capnp cimport _MessageBuilder

cdef extern from "rr_graph/graph2_capnp.h" namespace "graph2":
    cdef cppclass RrEdgesInserter:
        RrEdgesInserter(MessageBuilder*, unsigned int)
        void add_edge(unsigned int index, unsigned int src_node, unsigned int sink_node, unsigned int switch_id)

cdef class _RrEdgesInserter:
    cdef RrEdgesInserter *c_edges

    def __cinit__(self, _MessageBuilder builder, unsigned int num_edges):
        self.c_edges = new RrEdgesInserter(builder.thisptr, num_edges)

    def __dealloc__(self):
        del self.c_edges

    def add_edge(self, unsigned int index, unsigned int src_node, unsigned int sink_node, unsigned int switch_id):
        self.c_edges.add_edge(index, src_node, sink_node, switch_id)
