/* msgwin.h
 *   $Revision:   1.5  $
 *   $Author:   DBarksda  $
 *   $Date:   05 Jun 1997 16:11:10  $ */

#ifndef	MSGWIN_H
#define	MSGWIN_H

#include	"symtab.h"
#include	"errors.h"

#define	SEND_WHERE	printf("\n%-12s %4d\t",(__FILE__),(__LINE__));fflush(stdout);

#define	MESSAGE_CLASS_ERROR		0
#define	MESSAGE_CLASS_WARNING	1
#define	MESSAGE_CLASS_MISSING	2
#define	MESSAGE_CLASS_IOERROR	4
#define	MESSAGE_CLASS_TERMINATE	8
#define	MESSAGE_CLASS_FATALERROR	16

#define	SENDMESSAGE_NOHELP()	\
	{	\
		SendMessageNoHelp((__FILE__), (__LINE__));	\
	}

#define	SENDMESSAGE_HELP(number, msg)	\
	{	\
		SendMessageThisHelp((__FILE__), (__LINE__),	number, msg);	\
	}

#define	SENDMESSAGE_SIMERROR()	\
	{	\
	SendMessageSimErrorNoHelp((__FILE__), (__LINE__),	NULL);	\
	}


int		SendMessageTestAnyMessages(const char *, int);
void	SendMessageEndOfMessage(const char *, int);
void	SendMessageAliasIndex(const char *, int, int);
void	SendMessageClass(const char *, int, int);
void	SendMessageHandle(const char *, int, STHandle);
void	SendMessageReadin(const char *, int, const char *);
void	SendMessageSim(const char *, int, const char *);
void	SendMessageDisable(const char *, int);
void	SendMessageEnable(const char *, int);
void	SendMessageNoHelp(const char *, int);
void	SendMessageThisHelp(const char *, int, int,	const char * );
void	SendMessageSimErrorNoHelp(const char *, int, const char * );
void	SendMessageNodeName(const char *, int, const char *, int, int);
void	SendMessageProcessMessages(const char *, int);
void    SendMessageFindAnalogRefpinNode(const char *filename, 
                                        int lineno,
                                        int nodeIndex, 
                                        const char* nodeName);
void	SendMessageSetSchematicsDevName(const char *filename, int lineno, 
                                        const char* devName );
void	SendMessageSetPSpiceDevName(    const char *filename, int lineno, 
                                        const char* devName );
void	SendMessageSetAdditionalInfo(   const char *filename, int lineno, 
                                        const char* info );
#ifdef IN_DLL
  typedef void (*PROCSENDMESSAGEHELPID)( const char *, int, int);
  MAIN_FUNC PROCSENDMESSAGEHELPID fp_SendMessageHelpID;
  #define SendMessageHelpID (*fp_SendMessageHelpID)
#else
  MAIN_FUNC void	SendMessageHelpID( const char *, int, int);
#endif

struct	PSpiceMessage {
    
public:

    // constructor
    //
    // DaB 02 Jun 97 - Created
    //
    PSpiceMessage(void){
        next = 0;
        reset();
    }

	struct	PSpiceMessage*	next;
	char	*history;
	char	*pspice_message;
	char	*pspice_dev_name;
	char	*schematics_dev_name;
    char    *schematics_refpin;
    char	*analog_node_name;
    char    *additional_info;
	int		analog_node_number;
	int		analog_node_number_2;
	int		digital_node_number;
	struct	AliasEntry *alias_p;
	int		count;
	int		end_flag;
	int		err_class;
	int		help_id;
	STHandle	the_handle;
	
    // Resets all data members except next
    //
    // DaB 02 Jun 97 - Created
    //
    void reset(void){
        history = 0;
        pspice_message = 0;     
        pspice_dev_name = 0;    
        schematics_dev_name = 0;
        schematics_refpin = 0;  
        analog_node_name = 0; 
        additional_info = 0;
        analog_node_number = 0;  
        analog_node_number_2 = 0;
        digital_node_number = 0;
        alias_p = 0;
        count = 0;    
        end_flag = 0; 
        err_class = 0;
        help_id = 0;
        the_handle = 0;
    }
};

#define	SENDMESSAGE_HELPID(x)	\
	{	\
	SendMessageHelpID( (__FILE__), (__LINE__), x);	\
	}
#endif
