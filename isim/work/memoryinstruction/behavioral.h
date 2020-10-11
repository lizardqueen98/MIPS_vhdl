////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_memoryinstruction_behavioral_H
#define H_Work_memoryinstruction_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_memoryinstruction_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[2];

  HSimArrayType Mem_arraybase;
  HSimArrayType Mem_array;
  char *t7;
    HSim__s1 SA[1];
  int t8;
  char *t9;
    Work_memoryinstruction_behavioral(const char * name);
    ~Work_memoryinstruction_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_memoryinstruction_behavioral(const char *name);

#endif
