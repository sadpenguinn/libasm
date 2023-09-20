NAME = libasm_test

LIB_NAME = libasm.a

SRCS = src/main.c

OBJS = ${SRCS:.c=.o}

CC		= clang
RM		= rm -f

CFLAGS		= -g3

%.o:	%.c
		${CC} -o $@ -c $?  ${CFLAGS}

$(NAME): ${OBJS} $(LIB_NAME)
		${CC} ${OBJS} -L. -lasm -o ${NAME}

$(LIB_NAME):
		make -C libasm/ && cp libasm/libasm.a .

all:	${NAME}

clean:
		${RM} ${OBJS}

fclean:	clean
		${RM} ${NAME}

re:		fclean all

.PHONY : all clean fclean re teset