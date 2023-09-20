NAME = libasm_test

LIB_NAME = libasm.a

SRCS = src/main.c

OBJS = ${SRCS:.s=.o}

CC		= clang
RM		= rm -f

CFLAGS		= -g3

%.o:	%.s
		${CC} ${CFLAGS} $<

$(NAME): ${OBJS} $(LIB_NAME)
		${CC} -L. -lasm ${OBJS} -o ${NAME}

$(LIB_NAME):
		make -C libasm/ && cp libasm/libasm.a .

all:	${NAME}

clean:
		${RM} ${OBJS}

fclean:	clean
		${RM} ${NAME}

re:		fclean all

.PHONY : all clean fclean re teset
