package com.example.admindesk.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class PerformanceAspect {

    private static final Logger logger = LoggerFactory.getLogger(PerformanceAspect.class);

    @Around("execution(* com.example.admindesk.service.*.*(..))")
    public Object logServiceMethodTime(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        Object result = joinPoint.proceed();
        long endTime = System.currentTimeMillis();
        logger.info("Execution time of {}.{} :: {}ms", joinPoint.getSignature().getDeclaringTypeName(),
                joinPoint.getSignature().getName(), (endTime - startTime));
        return result;
    }

    @Around("execution(* com.example.admindesk.repo.*.*(..))")
    public Object logRepoMethodTime(ProceedingJoinPoint joinPoint) throws Throwable {
        long startTime = System.currentTimeMillis();
        Object result = joinPoint.proceed();
        long endTime = System.currentTimeMillis();
        logger.info("Execution time of {}.{} :: {}ms", joinPoint.getSignature().getDeclaringTypeName(),
                joinPoint.getSignature().getName(), (endTime - startTime));
        return result;
    }
}
