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

#ifndef H_Work_regfiletest_vhd_behavior_H
#define H_Work_regfiletest_vhd_behavior_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_regfiletest_vhd_behavior: public HSim__s6 {
public:


  char *t28;
  char *t29;
  char *t30;
  char *t31;
    HSim__s1 SA[8];
    Work_regfiletest_vhd_behavior(const char * name);
    ~Work_regfiletest_vhd_behavior();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_regfiletest_vhd_behavior(const char *name);

#endif
