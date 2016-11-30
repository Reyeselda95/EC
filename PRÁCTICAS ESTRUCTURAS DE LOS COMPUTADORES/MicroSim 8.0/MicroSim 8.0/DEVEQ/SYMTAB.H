/* symtab.h
 *   $Revision:   1.43  $
 *   $Author:   DBarksda  $
 *   $Date:   30 May 1997 18:31:26  $ */

#ifndef	SYMTAB_H
#define	SYMTAB_H
/* 05/19/88 JMS  Add globals for a digital node list and moved defines here
 *		 for WriteToken
 * 09/06/88 MUW  Add user global prefix definition, for global nodes.
 *		 Added digital global high, low and unknown level nodes.
 * 10/23/88 MUW  Make symbol table, analog and digital node tables different
 *		 sizes, for demo
 * 04/02/90 JMS  Add macro WriteToken(s).  Routine WriteTokenToTemp(s,PRFILE)
 *		 used to be WriteToken(s)
 * 04/10/90 MUW  Add text variable and constant
 * 06/13/90 MUW  Make symbol table bigger for machines with 32 bit int's
 * 06/05/90 GPB  Make those InputLineOffset and TokenOffset vars GLOBAL so we can do
		 a GrabFileName routine.'
 * 02/19/91 SV	 Change the names to be more mnemonic
 * 04/14/93 jgt  New (5.4) EVAL limits.
 * 09/20/93 rbh  Moved TokenOffset to be static in token.c.
 */


/* Defs used in calling WriteTokenToTemp */

#define NEW_STMT	'\n'				/* don't emit a '+' before string */
#define NORMAL		0

	/* necessary GLOBALS for GetToken and GrabFileName */
GLOBAL int		CheckSyntaxOnly;		/* 1 if -C specified on command line: used by Shell */
GLOBAL unsigned int	InputLineOffset;		/* byte offset (into InputLine) where we're scanning */
GLOBAL unsigned int	FirstChar, FirstCharType;	/* first token character, and its type */
GLOBAL unsigned int	TerminatingChar;		/* the terminating char of last token */
GLOBAL unsigned int	CharType[256];			/* indexed by character */


	/* definitions for CharType */
#define WHITE_SPACE		0	/* char is white space */
#define NUMERIC_CHAR		0x01	/* char is numeric */
#define ALPHABETIC_CHAR 	0x02	/* char is alpha */
#define END_OF_LINE_CHAR	0x04	/* char is end-of-line */
#define EXPR_LEFT_BRACE 	0x08	/* char is expr left  brace '{' */
#define EXPR_RIGHT_BRACE	0x10	/* char is expr right brace '}' */
#define DOUBLE_QUOTE		0x20	/* char is double quote '"' (TEXT constant) */
#define VERTICAL_BAR		0x40	/* char is vertical bar '|' (TEXT expression) */

#define TOKEN_DEF_SIZE	1024		/* starting size for RawToken */
#define TOKEN_GROW_BY	1024		/* expand size */

GLOBAL char	*RawToken;		/* the input token (characters between WHITE_SPACES) */
GLOBAL int	RawTokenSize;		/* current size of RawToken */
GLOBAL char	CookToken[4096];	/* Prefix + RawToken */
GLOBAL char	Prefix[MBUFF];		/* string prefixed */
GLOBAL char	FirstToken[MBUFF];	/* Device name (for subckt pin currents) */
GLOBAL int	ReadinNode;     	/* current device node (for subckt pin currents) */

GLOBAL char	InputLine[MBUFF+1];	/* input line */

GLOBAL double	TokenDbl;		/* double value */
GLOBAL int	TokenInt;		/* integer value */
GLOBAL	char	*TokenStr;		/* string constant */

GLOBAL int	TokenLen;		/* length of CookToken */
GLOBAL int	PrefixLen;		/* length of Prefix */
GLOBAL	char	*StrippedPtr;		/* ptr to 1st significant name char */
GLOBAL int	StrippedFirstChar;	/* first significant character (stripping prefixes) */
GLOBAL int	StrippedFirstType;	/* type of first significant character (stripping prefixes)  */

	/* * * * SYMBOL AND NODE TABLE * * * */

/* Symbol types:
*	Models	are upper case 'A'-'Z'
*	Devices are lower case 'a'-'z'
*
*	Distribution: 4   (^D)
*	Parameters:   5   (^E)
*
*	N & O device signal names:	'%'
*	N & O device file names:	'^'
*
*	Node Names ( in subcircuits ):	15
*/

#define MCDISTDEVTYPE		4
#define PARAMTYPE		5

	/* symbol table sizes & entries per block */
#if DEMO == YES
#if DEMO_TYPE == DEMO_MSIM
#define MAXANODENTRIES	(unsigned)64		/* max # of analog  nodes */
#define MAXDNODENTRIES	(unsigned)256		/* max # of digital nodes */
//#define MAXSYMENTRIES	(unsigned)511	/* max # of symbols */
#define MAXSYMENTRIES	(unsigned)0x8000	/* max # of symbols = 32768 */
#define ANBLOCKEXP	6			/* size of ana node block = 2^4 = 16 */
#define DNBLOCKEXP	6			/* size of dig node block = 2^4 = 16 */
//#define SYBLOCKEXP	6			/* size of sym tab  block = 2^5 = 32 */
#define SYBLOCKEXP	8			/* size of sym tab  block = 2^8 = 256 */
#elif DEMO_TYPE == DEMO_AMD
/* All digital */
#define MAXANODENTRIES	(unsigned)1		/* max # of analog  nodes = 32768 */
#define MAXDNODENTRIES	(unsigned)0x8000	/* max # of digital nodes = 32768 */
#define MAXSYMENTRIES	(unsigned)0x8000	/* max # of symbols = 32768 */
#define ANBLOCKEXP	1			/* size of ana node block = 2^1 = 2 */
#define DNBLOCKEXP	8			/* size of dig node block = 2^8 = 256 */
#define SYBLOCKEXP	8			/* size of sym tab  block = 2^8 = 256 */
#endif /* DEMO_TYPE */
#else /* DEMO */
#define MAXANODENTRIES	(unsigned)0x40000	/* max # of analog  nodes = 256K */
#define MAXDNODENTRIES	(unsigned)0x40000	/* max # of digital nodes = 256K */
#define MAXSYMENTRIES	(unsigned)0x40000	/* max # of symbols = 256K */
#define ANBLOCKEXP	9			/* size of ana node block = 2^9 = 512 */
#define DNBLOCKEXP	9			/* size of dig node block = 2^9 = 512 */
#define SYBLOCKEXP	9			/* size of sym tab  block = 2^9 = 512 */
#endif

#define NANODENTRIES	(1 << ANBLOCKEXP)	/* = 2^NBLOCKEXP */
#define NDNODENTRIES	(1 << DNBLOCKEXP)	/* = 2^NBLOCKEXP */
#define NSYMENTRIES	(1 << SYBLOCKEXP)	/* = 2^NBLOCKEXP */

	/* number of index blocks */
#define NANODXBLOCK	((MAXANODENTRIES+NANODENTRIES-1)/NANODENTRIES)
#define NDNODXBLOCK	((MAXDNODENTRIES+NDNODENTRIES-1)/NDNODENTRIES)
#define NSYMXBLOCK	((MAXSYMENTRIES + NSYMENTRIES-1)/NSYMENTRIES)

#define CHARBUFSIZE	512
#define SYMDEF		'd'
#define SYMREF		'r'
#define ALPHANODE	']'

#define STE_DTYPE_NODENAME	15	/* Symbol table type for nodenames */
#define STE_DTYPE_STIMNAME	16	/* Symbol table type for  STIMULUS names */

	/* enclose alphabetic node names thus: [name] to indicate
	 * a node where context not sufficient.
	 * e.g.,  the fourth node in q,
	 * .print v([node1])
	 * in .print v([node],node] second not necessarily []'ed due to context
	 * Edevice n1, n2, [POLY]  (POLY not keyword in this context)
	 */

#define DNXBLOCK(n)	(n >> DNBLOCKEXP)
#define DNXOFFSET(n)	(n & (NDNODENTRIES-1))

/* Generic handle to a symbol table entry */
typedef struct GenSymTabE* STHandle;

	/* for symbols */
struct SymTabE {
  char *SymName;	/* the name */
  STHandle  SymNext;	/* Next Sym table's entry's handle */
  int  *misc_p; 	/* miscellaneous pointer */
  char rd;		/* 'd' if defined, 'r' otherwise */
  char dev_type;	/* device type */
  };

	/* for nodes */
struct NodTabE {
  char *NodName;
  STHandle NodNext;	/* Next Node table's entry's handle */
  int  NodIdx;		/* Node Index */
  } ;

typedef struct NodTabE* NTEArray;
typedef struct SymTabE* STEArray;

	/* for names */
struct CharBuff {
  struct CharBuff *CharNextOne;
  char	CharName[CHARBUFSIZE];
  };


GLOBAL int CharAvail;			/* used by SaveStr */

GLOBAL struct CharBuff *Names;		/* ptr to head of names */
GLOBAL char	*TokenPtr;		/* ptr to current name in list */

GLOBAL int	*SortedNodes;		/* ptr to sorted node indeces */
GLOBAL int	*DSortedNodes;		/* ptr to sorted digital node indices */

/* Digital Node list */
#define NODE_DIGITAL	'D'		/* Flag to tell routines what node */
#define NODE_ANALOG	'A'		/* list to use */

/* Prefix for user defined global node/device names */
#define GLOBAL_PREFIX	"$G_"

#define DIG_LO_NODE	"$D_LO" 	/* digital global logic low node */
#define DIG_HI_NODE	"$D_HI" 	/* digital global logic hi  node */
#define DIG_XX_NODE	"$D_X"		/* digital global logic unknown node */
#define DIG_NC_NODE	"$D_NC" 	/* digital global "unconnected" node */

/* General symbol table unit.  Symbols symbol table unit requires
 * more */
struct GenSymTabE
{
  char* GenSymName;
  STHandle GenSymNext;
  union
  {
    int nodidx;
    int* mdlptr;
  }misc;
};


struct STTbl
{
  int type;			/* Type of table enum {ST_ANODE, ST_DNODE
				   ST_SYMBOL} */
  unsigned int tblSize; 	/* Number of buckets in table, this is
				   also the length of the Heads array */
  unsigned int modVal;		/* Modulo value to compute hash function.
				   modVal/2 <= tblSize < modVal is always
				   true */
  unsigned int inc_size;	/* Incremental size increase each time the
				   symbol table is expanded */
  int avg_depth;		/* Average tolerable depth of each link
				   in symbol table linked lists */
  int max_depth;		/* Maximum tolerable depth of each link */
  int longest;			/* Length of longest list currently found */
  int count;			/* Number of items in symbol table */
  STHandle *Heads;		/* The location of the heads of all the
				   link lists in the symbol table */
  int blk_len;			/* Length of each individual shattered
				   block array, must be power of 2 */
  int blk_lenexp;		/* log2(blk_len) */
  int blk_total;		/* Number of blocks for the shattered block
				   array */
  union 			/* The location of the first of the
				   shattered block arrays */
  {
    STEArray *sym;
    NTEArray *nod;
  }ShBlk;
  int overflow; 		/* If overflow == 1, we cannot expand the
				   table any more.  Normal value is 0.*/
};

#define ST_ANODE	1
#define ST_DNODE	2
#define ST_SYMBOL	3

GLOBAL struct STTbl* STana;	/* Global analog nodes symbol table */
GLOBAL struct STTbl* STdig;	/* Global digital nodes symbol table */
GLOBAL struct STTbl* STsym;	/* Global symbols symbol table */

#define INIT_TBL_SIZE 1024
#define INC_TBL_SIZE 256
#define AVGH 2
#define MAXH 4

/* Macros to access symbol table data */
#define STGETNAME(h)		((char *)   ((struct GenSymTabE *)(h))->GenSymName)
#define STGETNEXTHANDLE(h)	((STHandle) h->GenSymNext)
#define STGETSRD(h)		((char)     (((struct SymTabE *)h)->rd))
#define STGETSDEVTYPE(h)	((char)     (((struct SymTabE *)h)->dev_type))
#define STGETINDEX(h)		((int)	    (((struct NodTabE*) h)->NodIdx))

/* Digital node name from digital node index */
#define DNODENAME(i) (STGETNAME((STHandle)NodAddr(STdig,i)))

class cReadinState {
/*****************************************************************************
* Purpose
*   Stores and retrieves state of readin process to allow read ahead and
*   rewinding
*
* Discussion
*   Stores & retrieves readin info, including file pointer, offsets, current
*   line being read, etc. Construction of a cReadinState object automatically 
*   stores present state.
*
* Author
*   DEC - 02 Dec 96 - created to fix .SAVEBIAS problem introduced
*                     by bug fix QA-ID 15018.
*   DaB - 29 May 97 - changed mInputLine to char[], moved from token.c
*
*****************************************************************************/
public:
    inline cReadinState() {storeReadinState();};
    inline ~cReadinState() {};
    void storeReadinState(void);
    void retrieveReadinState(void);
private:
    FILE*   mInputFile_p;       // file pointer to present input source
    int     mFpos;              // offset into mInputFile_p
    int     mNoecho;            // NOECHO flag
    int     mFstatus;           // FSTATUS flag
    int     mNextstatus;        // NEXTSTATUS flag
    int     mInputLineNumber;   // number of current line being processed
    int     mInputLineOffset;   // index into current line
    char*   mInputCharPtr;      // char* pointer into current line
    char	mInputLine[MBUFF+1];// contents of current line
};

#endif	/* SYMTAB_H*/
