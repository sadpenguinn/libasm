NAME = libasm.a

SRCS = src/ft_strcmp.s src/ft_strlen.s src/ft_strcpy.s src/ft_write.s \
	   src/ft_read.s src/ft_strdup.s

OBJS = ${SRCS:.s=.o}

NA		= nasm
RM		= rm -f

NASMFLAGS	= -f elf64

%.o:	%.s
		${NA} ${NASMFLAGS} $<

$(NAME): ${OBJS}
		ar rcs ${NAME} ${OBJS}

all:	${NAME}

clean:
		${RM} ${OBJS}

fclean:	clean
		${RM} ${NAME}
		${RM} test

re:		fclean all

.PHONY : all clean fclean re teset
