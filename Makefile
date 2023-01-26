# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vstockma <vstockma@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/10 11:08:00 by vstockma          #+#    #+#              #
#    Updated: 2023/01/23 15:14:36 by vstockma         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SSRC	=	server.c
CSRC	=	client.c

SOBJS	=	$(SSRC:.c=.o)
COBJS	=	$(CSRC:.c=.o)

CC		=	cc
RM		=	rm -f
CFLAGS	=	-Wall -Wextra -Werror

SNAME = server
CNAME = client

LIBFT = libft/libft.a

all: $(SNAME) $(CNAME)

$(SNAME):
		$(CC) -o $(SNAME) $(CFLAGS) $(SSRC) $(LIBFT)

$(CNAME):
		$(CC) -o $(CNAME) $(CFLAGS) $(CSRC) $(LIBFT)

clean:
		@$(RM) $(SOBJS) $(COBJS)

fclean: clean
		@$(RM) $(SNAME) $(CNAME)

re:	fclean all

.PHONY: all clean fclean re