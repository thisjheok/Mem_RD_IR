#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// #include <rtems.h>
// #include "tmacros.h"

// const char rtems_test_name[] = "SIMPLE DHRYSTONE TEST";

#define Null  0 
#define true  1
#define false 0

typedef int     One_Thirty;
typedef int     One_Fifty;
typedef char    Capital_Letter;
typedef int     Boolean;
typedef char    Str_30 [31];
typedef int     Arr_1_Dim [50];
typedef int     Arr_2_Dim [50] [50];

typedef enum {Ident_1, Ident_2, Ident_3, Ident_4, Ident_5} Enumeration;

typedef struct record 
{
    struct record *Ptr_Comp;
    Enumeration    Discr;
    union {
          struct {
                  Enumeration Enum_Comp;
                  int         Int_Comp;
                  char        Str_Comp [31];
                  } var_1;
          struct {
                  Enumeration E_Comp_2;
                  char        Str_2_Comp [31];
                  } var_2;
          struct {
                  char        Ch_1_Comp;
                  char        Ch_2_Comp;
                  } var_3;
          } variant;
} Rec_Type, *Rec_Pointer;

void Proc_1 (Rec_Pointer);
void Proc_2 (One_Fifty *);
void Proc_3 (Rec_Pointer *);
void Proc_4 (void);
void Proc_5 (void);
void Proc_6 (Enumeration, Enumeration *);
void Proc_7 (One_Fifty, One_Fifty, One_Fifty *);
void Proc_8 (Arr_1_Dim, Arr_2_Dim, int, int);
Enumeration Func_1 (Capital_Letter, Capital_Letter);
Boolean Func_2 (Str_30, Str_30);
Boolean Func_3 (Enumeration);
// rtems_task Task(rtems_task_argument arg);

typedef struct {
    Rec_Pointer ptr_glob;
    Rec_Pointer next_ptr_glob;
    int int_glob;
    Boolean bool_glob;
    char ch_1_glob;
    char ch_2_glob;
    Arr_1_Dim arr_1_glob;
    Arr_2_Dim arr_2_glob;
    Str_30 str_1_loc;
    Str_30 str_2_loc;
} test_task_context;

static test_task_context task_context;

static int global_int_glob;
static char global_ch_1_glob;

void Proc_1(Rec_Pointer Ptr_Val_Par) {
    Rec_Pointer Next_Record = Ptr_Val_Par->Ptr_Comp;
    *Ptr_Val_Par->Ptr_Comp = *Ptr_Val_Par;
    Ptr_Val_Par->variant.var_1.Int_Comp = 5;
    Next_Record->variant.var_1.Int_Comp = Ptr_Val_Par->variant.var_1.Int_Comp;
    Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
    Proc_3(&Next_Record->Ptr_Comp);
    if (Next_Record->Discr == Ident_1) {
        Next_Record->variant.var_1.Int_Comp = 6;
        Proc_6(Ptr_Val_Par->variant.var_1.Enum_Comp, &Next_Record->variant.var_1.Enum_Comp);
        Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
        Proc_7(Next_Record->variant.var_1.Int_Comp, 10, &Next_Record->variant.var_1.Int_Comp);
    } else {
        *Ptr_Val_Par = *Ptr_Val_Par->Ptr_Comp;
    }
}

void Proc_2(One_Fifty *Int_Par_Ref) {
    One_Fifty Int_Loc;
    Enumeration Enum_Loc;
    Int_Loc = *Int_Par_Ref + 10;
    
    if (global_ch_1_glob == 'A') {
        Int_Loc -= 1;
        *Int_Par_Ref = Int_Loc - global_int_glob;
        Enum_Loc = Ident_1;
    } else {
        *Int_Par_Ref = Int_Loc;
        Enum_Loc = Ident_1;
    }
}

void Proc_3(Rec_Pointer *Ptr_Ref_Par) {
    if (global_int_glob > 100) {
        global_int_glob = 100;
    }
}

void Proc_4(void) {
    Boolean Bool_Loc;
    Bool_Loc = global_ch_1_glob == 'A';
    global_ch_1_glob = 'B';
}

void Proc_5(void) {
    global_ch_1_glob = 'A';
    global_ch_1_glob = global_ch_1_glob;
}

void Proc_6(Enumeration Enum_Val_Par, Enumeration *Enum_Ref_Par) {
    *Enum_Ref_Par = Enum_Val_Par;
    if (!Func_3(Enum_Val_Par)) {
        *Enum_Ref_Par = Ident_4;
    }
    switch (Enum_Val_Par) {
        case Ident_1: 
            *Enum_Ref_Par = Ident_1;
            break;
        case Ident_2: 
            if (global_int_glob > 100)
                *Enum_Ref_Par = Ident_1;
            else 
                *Enum_Ref_Par = Ident_4;
            break;
        case Ident_3: 
            *Enum_Ref_Par = Ident_2;
            break;
        case Ident_4: 
            break;
        case Ident_5: 
            *Enum_Ref_Par = Ident_3;
            break;
    }
}

void Proc_7(One_Fifty Int_1_Par_Val, One_Fifty Int_2_Par_Val, One_Fifty *Int_Par_Ref) {
    One_Fifty Int_Loc;
    Int_Loc = Int_1_Par_Val + 2;
    *Int_Par_Ref = Int_2_Par_Val + Int_Loc;
}

void Proc_8(Arr_1_Dim Arr_1_Par_Ref, Arr_2_Dim Arr_2_Par_Ref, int Int_1_Par_Val, int Int_2_Par_Val) {
    One_Fifty Int_Index;
    One_Fifty Int_Loc;
    Int_Loc = Int_1_Par_Val + 5;
    
    if (Int_Loc >= 50 || Int_Loc + 1 >= 50 || Int_Loc + 30 >= 50 || 
        Int_Loc + 20 >= 50 || Int_Loc - 1 < 0) {
        return;
    }
    
    Arr_1_Par_Ref[Int_Loc] = Int_2_Par_Val;
    Arr_1_Par_Ref[Int_Loc+1] = Arr_1_Par_Ref[Int_Loc];
    Arr_1_Par_Ref[Int_Loc+30] = Int_Loc;
    for (Int_Index = Int_Loc; Int_Index <= Int_Loc+1; ++Int_Index)
        Arr_2_Par_Ref[Int_Loc][Int_Index] = Int_Loc;
    Arr_2_Par_Ref[Int_Loc][Int_Loc-1] += 1;
    Arr_2_Par_Ref[Int_Loc+20][Int_Loc] = Arr_1_Par_Ref[Int_Loc];
    global_int_glob = 5;
}

Enumeration Func_1(Capital_Letter Ch_1_Par_Val, Capital_Letter Ch_2_Par_Val) {
    Capital_Letter Ch_1_Loc;
    Capital_Letter Ch_2_Loc;
    Ch_1_Loc = Ch_1_Par_Val;
    Ch_2_Loc = Ch_1_Loc;
    if (Ch_2_Loc != Ch_2_Par_Val)
        return (Ident_1);
    else {
        global_ch_1_glob = Ch_1_Loc;
        return (Ident_2);
    }
}

Boolean Func_2(Str_30 Str_1_Par_Ref, Str_30 Str_2_Par_Ref) {
    One_Thirty Int_Loc;
    Capital_Letter Ch_Loc = 'A';
    Int_Loc = 2;
    while (Int_Loc <= 2) {
        if (Func_1(Str_1_Par_Ref[Int_Loc], Str_2_Par_Ref[Int_Loc+1]) == Ident_1) {
            Ch_Loc = 'A';
            Int_Loc += 1;
        } else {
            break;
        }
    }
    if (Ch_Loc >= 'W' && Ch_Loc < 'Z')
        Int_Loc = 7;
    if (Ch_Loc == 'R')
        return (true);
    else {
        if (strcmp(Str_1_Par_Ref, Str_2_Par_Ref) > 0) {
            Int_Loc += 7;
            global_int_glob = Int_Loc;
            return (true);
        } else
            return (false);
    }
}

Boolean Func_3(Enumeration Enum_Par_Val) {
    Enumeration Enum_Loc;
    Enum_Loc = Enum_Par_Val;
    if (Enum_Loc == Ident_3)
        return (true);
    else
        return (false);
}

static void run_dhrystone_workload(test_task_context *ctx) {
    One_Fifty Int_1_Loc;
    One_Fifty Int_2_Loc;
    One_Fifty Int_3_Loc;
    char Ch_Index;
    Enumeration Enum_Loc;
    
    Proc_5();
    Proc_4();
    Int_1_Loc = 2;
    Int_2_Loc = 3;
    strcpy(ctx->str_2_loc, "DHRYSTONE PROGRAM, 2'ND STRING");
    Enum_Loc = Ident_2;
    ctx->bool_glob = !Func_2(ctx->str_1_loc, ctx->str_2_loc);
    
    while (Int_1_Loc < Int_2_Loc) {
        Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
        Proc_7(Int_1_Loc, Int_2_Loc, &Int_3_Loc);
        Int_1_Loc += 1;
    }
    
    Proc_8(ctx->arr_1_glob, ctx->arr_2_glob, Int_1_Loc, Int_3_Loc);
    Proc_1(ctx->ptr_glob);
    
    for (Ch_Index = 'A'; Ch_Index <= ctx->ch_2_glob; ++Ch_Index) {
        if (Enum_Loc == Func_1(Ch_Index, 'C')) {
            Proc_6(Ident_1, &Enum_Loc);
            strcpy(ctx->str_2_loc, "DHRYSTONE PROGRAM, 3'RD STRING");
            Int_2_Loc = Ch_Index;
            ctx->int_glob = Ch_Index;
        }
    }
    
    Int_2_Loc = Int_2_Loc * Int_1_Loc;
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
    Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
    Proc_2(&Int_1_Loc);        

}

// rtems_task Task(rtems_task_argument arg) {
//     test_task_context *ctx = (test_task_context *)arg;
    
//     printf("Task started - running dhrystone once\n");
    
//     run_dhrystone_workload(ctx);
    
//     printf("Dhrystone completed - task ending\n");
    
//     rtems_task_delete(RTEMS_SELF);
// }

// static void Init(rtems_task_argument ignored) {
//     rtems_status_code sc;
    
//     printf("Simple Dhrystone Test Starting\n");
    
//     test_task_context *ctx = &task_context;
    
//     ctx->ptr_glob = (Rec_Pointer) malloc(sizeof(Rec_Type));
//     ctx->next_ptr_glob = (Rec_Pointer) malloc(sizeof(Rec_Type));
    
//     if (ctx->ptr_glob && ctx->next_ptr_glob) {
//         ctx->ptr_glob->Ptr_Comp = ctx->next_ptr_glob;
//         ctx->ptr_glob->Discr = Ident_1;
//         ctx->ptr_glob->variant.var_1.Enum_Comp = Ident_3;
//         ctx->ptr_glob->variant.var_1.Int_Comp = 40;
//         strcpy(ctx->ptr_glob->variant.var_1.Str_Comp, "DHRYSTONE PROGRAM, SOME STRING");
//         ctx->next_ptr_glob->Ptr_Comp = ctx->ptr_glob;
//         ctx->next_ptr_glob->Discr = Ident_2;
//         ctx->next_ptr_glob->variant.var_2.E_Comp_2 = Ident_2;
//         ctx->next_ptr_glob->variant.var_2.Str_2_Comp[0] = '\0';
//     }
    
//     ctx->int_glob = 0;
//     ctx->bool_glob = false;
//     ctx->ch_1_glob = '\0';
//     ctx->ch_2_glob = 'Z';
    
//     for (int k = 0; k < 50; k++) {
//         ctx->arr_1_glob[k] = k;
//         for (int l = 0; l < 50; l++) {
//             ctx->arr_2_glob[k][l] = k + l;
//         }
//     }
    
//     strcpy(ctx->str_1_loc, "DHRYSTONE PROGRAM, 1'ST STRING");
//     ctx->str_2_loc[0] = '\0';

//     printf("Task creating\n");
//     sc = rtems_task_create(
//         rtems_build_name('T', 'A', 'S', 'K'),
//         1,
//         RTEMS_MINIMUM_STACK_SIZE * 2,
//         RTEMS_DEFAULT_MODES,
//         RTEMS_DEFAULT_ATTRIBUTES | RTEMS_FLOATING_POINT,
//         &ctx->id
//     );
//     directive_failed(sc, "task create");
    
//     sc = rtems_task_start(ctx->id, Task, (rtems_task_argument)ctx);
//     directive_failed(sc, "task start");
    
//     sc = rtems_task_wake_after(100);
    
//     if (ctx->ptr_glob) {
//         free(ctx->ptr_glob);
//     }
//     if (ctx->next_ptr_glob) {
//         free(ctx->next_ptr_glob);
//     }

//     printf("Test completed\n");
//     rtems_test_exit(0);
// }

// #define CONFIGURE_APPLICATION_NEEDS_CLOCK_DRIVER
// #define CONFIGURE_APPLICATION_NEEDS_SIMPLE_CONSOLE_DRIVER
// #define CONFIGURE_USE_IMFS_AS_BASE_FILESYSTEM
// #define CONFIGURE_MAXIMUM_TASKS 5
// #define CONFIGURE_MICROSECONDS_PER_TICK 1000
// #define CONFIGURE_MAXIMUM_PROCESSORS 1
// #define CONFIGURE_INIT_TASK_ATTRIBUTES RTEMS_FLOATING_POINT

// #define CONFIGURE_RTEMS_INIT_TASKS_TABLE
// #define CONFIGURE_INIT
// #include <rtems/confdefs.h>
