# cython: language_level=3, language=c++
from capnp.includes.capnp_cpp cimport Node
from capnp.includes.schema_cpp cimport MessageBuilder

cdef extern from "rr_graph/graph2_capnp.h" namespace "graph2":
    cdef cppclass RrEdgesInserter:
        void init(MessageBuilder, unsigned int)
        void add_edge(unsigned int index, unsigned int src_node, unsigned int sink_node, unsigned int switch_id)
