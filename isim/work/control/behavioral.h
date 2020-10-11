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

#ifndef H_Work_control_behavioral_H
#define H_Work_control_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_control_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[10];

  char t20;
HSimConstraints *c21;
  char t22;
HSimConstraints *c23;
  char t24;
HSimConstraints *c25;
  char t26;
HSimConstraints *c27;
  char t28;
HSimConstraints *c29;
  char t30;
HSimConstraints *c31;
  char t32;
HSimConstraints *c33;
    Work_control_behavioral(const char * name);
    ~Work_control_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_control_behavioral(const char *name);

#endif
