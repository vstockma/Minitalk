/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vstockma <vstockma@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/23 15:15:42 by vstockma          #+#    #+#             */
/*   Updated: 2023/01/24 10:15:05 by vstockma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft/libft.h"
#include "minitalk.h"

void	ft_handle(int signal)
{
	static int	bit;
	static int	c;

	if (signal == SIGUSR1)
		c |= (1 << bit);
	bit++;
	if (bit == 8)
	{
		ft_printf("%c", c);
		bit = 0;
		c = 0;
	}
}

int	main(int ac, char **av)
{
	int	pid;

	(void)av;
	if (ac != 1)
	{
		ft_printf("Wrong amount of arguments!");
		return (1);
	}
	else
	{
		pid = getpid();
		ft_printf("PID = %i\n", pid);
	}
	while (1)
	{
		signal(SIGUSR1, ft_handle);
		signal(SIGUSR2, ft_handle);
		pause();
	}
	return (0);
}
