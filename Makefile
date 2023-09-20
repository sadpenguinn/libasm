NAME = libasm_test
LIB_NAME = asm

SRCS = src/main.c

OBJS = ${SRCS:.c=.o}

CC		= clang
FLAGS	= -g3

%.o: %.c
	${CC} -o $@ -c $?  ${FLAGS}

$(NAME): ${OBJS} lib$(LIB_NAME).a
	${CC} ${OBJS} -L. -l${LIB_NAME} -o ${NAME}

lib$(LIB_NAME).a:
	make -C lib${LIB_NAME}/ && cp lib${LIB_NAME}/lib${LIB_NAME}.a .

all: ${NAME}

clean:
	rm -f ${OBJS}

fclean:	clean
	rm -f ${NAME}
	rm -f lib${LIB_NAME}.a

re: fclean all

.PHONY : all clean fclean re teset
